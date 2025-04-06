package br.com.dio.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "tb_news")
public class News extends BaseItem {
}
