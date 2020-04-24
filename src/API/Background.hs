-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Background where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.Document as Document

data Background = 
 Background { _type :: Maybe BackgroundType.BackgroundType, document :: Maybe Document.Document, name :: Maybe String, is_dark :: Maybe Bool, is_default :: Maybe Bool, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Background where
 toJSON (Background { _type = _type, document = document, name = name, is_dark = is_dark, is_default = is_default, _id = _id }) =
  A.object [ "@type" A..= T.String "background", "type" A..= _type, "document" A..= document, "name" A..= name, "is_dark" A..= is_dark, "is_default" A..= is_default, "id" A..= _id ]

instance T.FromJSON Background where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "background" -> parseBackground v
   _ -> mempty
  where
   parseBackground :: A.Value -> T.Parser Background
   parseBackground = A.withObject "Background" $ \o -> do
    _type <- optional $ o A..: "type"
    document <- optional $ o A..: "document"
    name <- optional $ o A..: "name"
    is_dark <- optional $ o A..: "is_dark"
    is_default <- optional $ o A..: "is_default"
    _id <- optional $ o A..: "id"
    return $ Background { _type = _type, document = document, name = name, is_dark = is_dark, is_default = is_default, _id = _id }