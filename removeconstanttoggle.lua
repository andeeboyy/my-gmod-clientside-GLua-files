if timer.Exists("constant_cleanup") then
    timer.Remove("constant_cleanup")

    print("Cleanup Off.")

    else

    print("Cleanup On.")

    timer.Create("constant_cleanup", 0, 0, function() RunConsoleCommand("gmod_admin_cleanup") 
    end)

end

