-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntity where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntityType as TextEntityType

--main = putStrLn "ok"

data TextEntity = 
 TextEntity { _type :: TextEntityType.TextEntityType, _length :: Int, offset :: Int }  -- deriving (Show)

instance T.ToJSON TextEntity where
 toJSON (TextEntity { _type = _type, _length = _length, offset = offset }) =
  A.object [ "@type" A..= T.String "textEntity", "type" A..= _type, "length" A..= _length, "offset" A..= offset ]
-- textEntity TextEntity  { _type :: TextEntityType.TextEntityType, _length :: Int, offset :: Int } 

