-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Background where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.BackgroundType as BackgroundType
import {-# SOURCE #-} qualified API.Document as Document

--main = putStrLn "ok"

data Background = 
 Background { _type :: BackgroundType.BackgroundType, document :: Document.Document, name :: String, is_dark :: Bool, is_default :: Bool, _id :: Int }  -- deriving (Show)

instance T.ToJSON Background where
 toJSON (Background { _type = _type, document = document, name = name, is_dark = is_dark, is_default = is_default, _id = _id }) =
  A.object [ "@type" A..= T.String "background", "type" A..= _type, "document" A..= document, "name" A..= name, "is_dark" A..= is_dark, "is_default" A..= is_default, "id" A..= _id ]
-- background Background  { _type :: BackgroundType.BackgroundType, document :: Document.Document, name :: String, is_dark :: Bool, is_default :: Bool, _id :: Int } 

