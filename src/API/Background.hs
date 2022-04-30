-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Background where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.Document as Document

-- |
-- 
-- Describes a chat background
-- 
-- __id__ Unique background identifier
-- 
-- __is_default__ True, if this is one of default backgrounds
-- 
-- __is_dark__ True, if the background is dark and is recommended to be used with dark theme
-- 
-- __name__ Unique background name
-- 
-- __document__ Document with the background; may be null. Null only for filled backgrounds
-- 
-- __type__ Type of the background
data Background = 

 Background { _type :: Maybe BackgroundType.BackgroundType, document :: Maybe Document.Document, name :: Maybe String, is_dark :: Maybe Bool, is_default :: Maybe Bool, _id :: Maybe Int }  deriving (Eq)

instance Show Background where
 show Background { _type=_type, document=document, name=name, is_dark=is_dark, is_default=is_default, _id=_id } =
  "Background" ++ U.cc [U.p "_type" _type, U.p "document" document, U.p "name" name, U.p "is_dark" is_dark, U.p "is_default" is_default, U.p "_id" _id ]

instance T.ToJSON Background where
 toJSON Background { _type = _type, document = document, name = name, is_dark = is_dark, is_default = is_default, _id = _id } =
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
    _type <- o A..:? "type"
    document <- o A..:? "document"
    name <- o A..:? "name"
    is_dark <- o A..:? "is_dark"
    is_default <- o A..:? "is_default"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Background { _type = _type, document = document, name = name, is_dark = is_dark, is_default = is_default, _id = _id }
 parseJSON _ = mempty
