-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntity where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.TextEntityType as TextEntityType

-- |
-- 
-- Represents a part of the text that needs to be formatted in some unusual way 
-- 
-- __offset__ Offset of the entity, in UTF-16 code units
-- 
-- __length__ Length of the entity, in UTF-16 code units
-- 
-- __type__ Type of the entity
data TextEntity = 

 TextEntity { _type :: Maybe TextEntityType.TextEntityType, _length :: Maybe Int, offset :: Maybe Int }  deriving (Eq)

instance Show TextEntity where
 show TextEntity { _type=_type, _length=_length, offset=offset } =
  "TextEntity" ++ U.cc [U.p "_type" _type, U.p "_length" _length, U.p "offset" offset ]

instance T.ToJSON TextEntity where
 toJSON TextEntity { _type = _type, _length = _length, offset = offset } =
  A.object [ "@type" A..= T.String "textEntity", "type" A..= _type, "length" A..= _length, "offset" A..= offset ]

instance T.FromJSON TextEntity where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "textEntity" -> parseTextEntity v
   _ -> mempty
  where
   parseTextEntity :: A.Value -> T.Parser TextEntity
   parseTextEntity = A.withObject "TextEntity" $ \o -> do
    _type <- o A..:? "type"
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    offset <- mconcat [ o A..:? "offset", readMaybe <$> (o A..: "offset" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TextEntity { _type = _type, _length = _length, offset = offset }
 parseJSON _ = mempty
