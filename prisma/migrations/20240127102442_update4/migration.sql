-- DropForeignKey
ALTER TABLE `subcategories` DROP FOREIGN KEY `Subcategories_categoryID_fkey`;

-- AlterTable
ALTER TABLE `subcategories` MODIFY `categoryID` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `Subcategories` ADD CONSTRAINT `Subcategories_categoryID_fkey` FOREIGN KEY (`categoryID`) REFERENCES `Categories`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
