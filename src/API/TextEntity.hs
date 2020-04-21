-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntity where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntityType as TextEntityType

--main = putStrLn "ok"

data TextEntity = 
 TextEntity { _type :: TextEntityType.TextEntityType, _length :: Int, offset :: Int }  deriving (Show)

instance T.ToJSON TextEntity where
 toJSON (TextEntity { _type = _type, _length = _length, offset = offset }) =
  A.object [ "@type" A..= T.String "textEntity", "type" A..= _type, "length" A..= _length, "offset" A..= offset ]



instance T.FromJSON TextEntity where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "textEntity" -> parseTextEntity v

   _ -> mempty ""
  where
   parseTextEntity :: A.Value -> T.Parser TextEntity
   parseTextEntity = A.withObject "TextEntity" $ \o -> do
    _type <- o A..: "type"
    _length <- o A..: "length"
    offset <- o A..: "offset"
    return $ TextEntity { _type = _type, _length = _length, offset = offset }