$path_to_flashka = "D:\"						          #path to flash drive
$path_to_source_files_folder = "C:\distrib\"	#path to distrib

$count = 0
$source_folder_content = ls $path_to_source_files_folder
$first_source_file = $source_folder_content[0].ToString()

while(1 -ne 10)
{
    $cond = Test-Path $path_to_flashka

    if($cond)
    {
        $condition = Test-Path $first_source_file
        if ( !$condition )
        {
            clear
            echo "Начало копирования"
            cp -r $path_to_source_files_folder* $path_to_flashka 
            echo "Coping to falsh drive number $count finished"
            $count++
        }
        else 
        {
            echo "This flash drive already contains files from distrib"
        }
    }
    else
    {
        echo "Flash drive not found!"
    }
    sleep(1)
}
