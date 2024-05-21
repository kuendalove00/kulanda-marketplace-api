import { Injectable } from '@nestjs/common';
import { CreateStoreDto } from './dto/create-store.dto';
import { UpdateStoreDto } from './dto/update-store.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class StoreService {
  constructor(private prisma: PrismaService){}

  async create(data : CreateStoreDto) {
    const store = await this.prisma.stores.create({ data: {
      name: data.name,
  sid: data.name.toLowerCase().split(" ").join(""),
  address: data.address,
  phoneNumber: data.phoneNumber,
  email: data.email,
  description: data.description,
  color: data.color,
  customization: data.customization,
  userID: data.userID
    } });
    return store;
  }

  async findAll() {
    const stores = await this.prisma.stores.findMany();
    return stores;
  }

  async findOne(id: number) {
    const store = await this.prisma.stores.findUnique({
      where: {
        id: id
      }
    });

    return store;
  }

  async findByName(name: string) {
    const store = await this.prisma.stores.findFirst({
      where: {
        sid: name
      }
    });

    return store;
  }

  async update(id: number, data: UpdateStoreDto) {
    const store = await this.prisma.stores.update({
      where: {
        id:id
      },
      data
    });

    return store;
  }

  async remove(id: number) {
    const store = await this.prisma.stores.delete({
      where: {
        id: id
      }
    });

    return store;
  }
}
