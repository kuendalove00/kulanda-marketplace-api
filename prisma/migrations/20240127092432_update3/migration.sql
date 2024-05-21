/*
  Warnings:

  - You are about to drop the column `productDetailsID` on the `images` table. All the data in the column will be lost.
  - You are about to drop the column `customizationID` on the `stores` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[storeID]` on the table `Customization` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `productID` to the `Images` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productID` to the `ProductDetails` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `images` DROP COLUMN `productDetailsID`,
    ADD COLUMN `productID` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `productdetails` ADD COLUMN `productID` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `stores` DROP COLUMN `customizationID`;

-- CreateTable
CREATE TABLE `Owners` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `gender` ENUM('Masculino', 'Feminino') NOT NULL,
    `birthDate` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `userID` INTEGER NOT NULL,

    UNIQUE INDEX `Owners_userID_key`(`userID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Customization_storeID_key` ON `Customization`(`storeID`);

-- AddForeignKey
ALTER TABLE `Owners` ADD CONSTRAINT `Owners_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Products` ADD CONSTRAINT `Products_subcategoryID_fkey` FOREIGN KEY (`subcategoryID`) REFERENCES `Subcategories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ProductDetails` ADD CONSTRAINT `ProductDetails_productID_fkey` FOREIGN KEY (`productID`) REFERENCES `Products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Stores` ADD CONSTRAINT `Stores_ownerID_fkey` FOREIGN KEY (`ownerID`) REFERENCES `Owners`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Subcategories` ADD CONSTRAINT `Subcategories_categoryID_fkey` FOREIGN KEY (`categoryID`) REFERENCES `Categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Models` ADD CONSTRAINT `Models_brandID_fkey` FOREIGN KEY (`brandID`) REFERENCES `Brands`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Customization` ADD CONSTRAINT `Customization_storeID_fkey` FOREIGN KEY (`storeID`) REFERENCES `Stores`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Images` ADD CONSTRAINT `Images_productID_fkey` FOREIGN KEY (`productID`) REFERENCES `Products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
