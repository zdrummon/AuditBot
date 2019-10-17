KillJIS() {
    if (WinExist("Job Inquiry Screen"))
    {
        Logger("closing", "job inquiry screen")
        WinActivate
        Sleep, 1000
        Click, 985, 15
    }
}