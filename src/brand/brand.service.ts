import { Injectable } from '@nestjs/common';
import { CreateBrandDto } from './dto/create-brand.dto';
import { UpdateBrandDto } from './dto/update-brand.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class BrandService {
  constructor(private prisma: PrismaService){}

  async create(data : CreateBrandDto) {
    const brand = await this.prisma.brands.create({ data });
    return brand;
  }

  async findAll() {
    const brands = await this.prisma.brands.findMany();
    return brands;
  }

  async findOne(id: number) {
    const brand = await this.prisma.brands.findUnique({
      where: {
        id: id
      }
    });

    return brand;
  }

  async update(id: number, data: UpdateBrandDto) {
    const brand = await this.prisma.brands.update({
      where: {
        id:id
      },
      data
    });

    return brand;
  }

  async remove(id: number) {
    const brand = await this.prisma.brands.delete({
      where: {
        id: id
      }
    });

    return brand;
  }
}
