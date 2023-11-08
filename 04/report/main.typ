#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Exercise 4: Convolutional Neural Networks",
  authors: (
    "Fabian Haas",
    "Markus Reichl",
    "Florian Weingartshofer",
  ),
  date: "November 6, 2023",
)

The goal of this exercise was to predict food classes from the *food 11* dataset by using different convolutional neural networks.

=== Data Preparation

We decided to use *PyTorch* for this exercise, so we needed to preprocess the dataset so it can be used by pytorch.
For this, we implemented a ``DataLoader`` for pytorch that loads and transforms the data. The transformation works by resizing the images to 128x128 and normalizing them.

=== Models
- *Implemented*: these models have been implemented by us.
 - *Custom*: this is a simple convolutional neural network implemented by us and inspired by *ResNet*. It consists of a convolutional layer followed by a ReLu, a residual block and a max pooling layer followed by the same thing a second time and finished by a fully connected layer with a ReLu and another fully connected layer tham maps to the 11 outputs.
 - *LeNet*: this is an implementation of the *LeNet* mentioned in the lecture.
- *Pretrained*: we used these pretrained models: *ResNet50*, *ResNet152*, *GoogLeNet*, 

=== Training and Evaluation

Due to the limited processing capabilities of our hardware, we limited the training epoches to 10, as more takes forever to train. We did not perform a cross validation to find good hyperparameters for this exercise, as the main goal was to try different implementations and it would just exponentailly increase training time. Instead we used *CrossEntropyLoss* as the loss function for all the models and the *Adam* optimizer with a learning rate of _0.001_.
@diagrams, shows the _training loss_ on the training data as wells as the _accuracy_ on the validation dataset.
We also evaluated the models in more details via the *classification_report* from *sklearn* which can be seen in @classification-report.

#figure(
  stack(
    dir: ltr,
    spacing: 10pt,
    image("training-loss.png", width: 50%),
    image("accuracy.png", width: 50%),
  ),
  caption: "Training loss and Validation Accuracy"
) <diagrams>


#figure(
  image("image.png", width: 20%),
  caption: "ResNet50 classification report"
) <classification-report>

As the results show, the *pre-trained* models vastly outperform the one we implemented ourselves. The results of the  models could be improvement by optimizing the hyperparameters with e.g. *GridSearchCV* and training for more epochs. We could also improve our training strategy. like using StratifiedKFold. The *classification-reports* also show, that the models achieve different results for each of the categories and that the representation of the categories itself is not uniform, which is not ideal.

