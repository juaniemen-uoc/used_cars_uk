File.open('../aprox100KUsedCars.csv', 'w+') do |f|
    idx = false
    Dir['./archive/*'].each do |m|

        if(File.basename(m).start_with?('unclean') || File.basename(m).start_with?('cclass') || File.basename(m).start_with?('focus'))
            next
        end
        
        File.read(m).each_line do |line|
            if idx
                if line.strip.start_with?('model')
                    next
                end
            else
                f.write("manufacturer," + line.lstrip)
                idx = true
                next
            end
            name = File.basename(m, ".csv")
            f.write(name + "," + line.lstrip)
        end

    end
end


