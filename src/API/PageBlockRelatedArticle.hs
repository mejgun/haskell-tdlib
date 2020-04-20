-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PageBlockRelatedArticle where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Photo as Photo

--main = putStrLn "ok"

data PageBlockRelatedArticle = 
 PageBlockRelatedArticle { publish_date :: Int, author :: String, photo :: Photo.Photo, description :: String, title :: String, url :: String }  -- deriving (Show)

instance T.ToJSON PageBlockRelatedArticle where
 toJSON (PageBlockRelatedArticle { publish_date = publish_date, author = author, photo = photo, description = description, title = title, url = url }) =
  A.object [ "@type" A..= T.String "pageBlockRelatedArticle", "publish_date" A..= publish_date, "author" A..= author, "photo" A..= photo, "description" A..= description, "title" A..= title, "url" A..= url ]
-- pageBlockRelatedArticle PageBlockRelatedArticle  { publish_date :: Int, author :: String, photo :: Photo.Photo, description :: String, title :: String, url :: String } 

