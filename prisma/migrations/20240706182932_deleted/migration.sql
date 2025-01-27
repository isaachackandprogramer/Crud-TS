/*
  Warnings:

  - You are about to drop the column `deleteAt` on the `User` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "nickName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "deleted" BOOLEAN NOT NULL DEFAULT false
);
INSERT INTO "new_User" ("email", "id", "name", "nickName", "password") SELECT "email", "id", "name", "nickName", "password" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE UNIQUE INDEX "User_nickName_key" ON "User"("nickName");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
