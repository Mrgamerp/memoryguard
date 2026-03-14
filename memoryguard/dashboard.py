import time
import os
import psutil
from datetime import datetime
from rich.table import Table
from rich.live import Live
from rich.console import Console

class MemoryDashboard:
    def __init__(self, interval: float = 1.0):
        self.interval = interval
        self.console = Console()

    def _create_memory_table(self) -> Table:
        table = Table(title="MemoryGuard Live Monitor", show_header=True, header_style="bold magenta")
        table.add_column("PID", style="dim")
        table.add_column("Name", style="cyan")
        table.add_column("RSS (MB)", justify="right")
        table.add_column("VMS (MB)", justify="right")
        table.add_column("Memory %", justify="right")
        
        processes = sorted(psutil.process_iter(['pid', 'name', 'memory_info', 'memory_percent']), 
                          key=lambda x: x.info['memory_percent'], 
                          reverse=True)[:10]
        
        for proc in processes:
            try:
                pinfo = proc.info
                table.add_row(
                    str(pinfo['pid']),
                    pinfo['name'][:20],
                    f"{pinfo['memory_info'].rss / 1024 / 1024:.1f}",
                    f"{pinfo['memory_info'].vms / 1024 / 1024:.1f}",
                    f"{pinfo['memory_percent']:.2f}"
                )
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                continue
        return table

    def run(self):
        with Live(self._create_memory_table(), refresh_per_second=4) as live:
            try:
                while True:
                    time.sleep(self.interval)
                    live.update(self._create_memory_table())
            except KeyboardInterrupt:
                self.console.print("\n[bold yellow]Dashboard beendet.[/bold yellow]")

if __name__ == "__main__":
    dashboard = MemoryDashboard()
    dashboard.run()
