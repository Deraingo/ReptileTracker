-- CreateTable
CREATE TABLE "Reptile" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "species" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "sex" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Reptile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Feeding" (
    "id" SERIAL NOT NULL,
    "reptile_id" INTEGER NOT NULL,
    "food_item" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Feeding_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Husbandry_Record" (
    "id" SERIAL NOT NULL,
    "reptile_id" INTEGER NOT NULL,
    "length" DOUBLE PRECISION NOT NULL,
    "weight" DOUBLE PRECISION NOT NULL,
    "temperature" DOUBLE PRECISION NOT NULL,
    "humidity" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Husbandry_Record_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Schedule" (
    "id" SERIAL NOT NULL,
    "reptile_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "monday" BOOLEAN NOT NULL,
    "tuesday" BOOLEAN NOT NULL,
    "wednesday" BOOLEAN NOT NULL,
    "thursday" BOOLEAN NOT NULL,
    "friday" BOOLEAN NOT NULL,
    "saturday" BOOLEAN NOT NULL,
    "sunday" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Reptile_user_id_key" ON "Reptile"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Feeding_reptile_id_key" ON "Feeding"("reptile_id");

-- CreateIndex
CREATE UNIQUE INDEX "Husbandry_Record_reptile_id_key" ON "Husbandry_Record"("reptile_id");

-- CreateIndex
CREATE UNIQUE INDEX "Schedule_reptile_id_key" ON "Schedule"("reptile_id");

-- CreateIndex
CREATE UNIQUE INDEX "Schedule_user_id_key" ON "Schedule"("user_id");

-- AddForeignKey
ALTER TABLE "Reptile" ADD CONSTRAINT "Reptile_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Feeding" ADD CONSTRAINT "Feeding_reptile_id_fkey" FOREIGN KEY ("reptile_id") REFERENCES "Reptile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Husbandry_Record" ADD CONSTRAINT "Husbandry_Record_reptile_id_fkey" FOREIGN KEY ("reptile_id") REFERENCES "Reptile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_reptile_id_fkey" FOREIGN KEY ("reptile_id") REFERENCES "Reptile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
