-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockRelatedArticle where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Photo as Photo

data PageBlockRelatedArticle = 
 PageBlockRelatedArticle { publish_date :: Maybe Int, author :: Maybe String, photo :: Maybe Photo.Photo, description :: Maybe String, title :: Maybe String, url :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON PageBlockRelatedArticle where
 toJSON (PageBlockRelatedArticle { publish_date = publish_date, author = author, photo = photo, description = description, title = title, url = url }) =
  A.object [ "@type" A..= T.String "pageBlockRelatedArticle", "publish_date" A..= publish_date, "author" A..= author, "photo" A..= photo, "description" A..= description, "title" A..= title, "url" A..= url ]

instance T.FromJSON PageBlockRelatedArticle where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pageBlockRelatedArticle" -> parsePageBlockRelatedArticle v
   _ -> mempty
  where
   parsePageBlockRelatedArticle :: A.Value -> T.Parser PageBlockRelatedArticle
   parsePageBlockRelatedArticle = A.withObject "PageBlockRelatedArticle" $ \o -> do
    publish_date <- mconcat [ o A..:? "publish_date", readMaybe <$> (o A..: "publish_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    author <- o A..:? "author"
    photo <- o A..:? "photo"
    description <- o A..:? "description"
    title <- o A..:? "title"
    url <- o A..:? "url"
    return $ PageBlockRelatedArticle { publish_date = publish_date, author = author, photo = photo, description = description, title = title, url = url }