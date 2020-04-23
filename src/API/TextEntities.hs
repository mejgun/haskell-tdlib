-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntities where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.TextEntity as TextEntity

data TextEntities = 
 TextEntities { entities :: Maybe [TextEntity.TextEntity] }  deriving (Show)

instance T.ToJSON TextEntities where
 toJSON (TextEntities { entities = entities }) =
  A.object [ "@type" A..= T.String "textEntities", "entities" A..= entities ]

instance T.FromJSON TextEntities where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "textEntities" -> parseTextEntities v
   _ -> mempty
  where
   parseTextEntities :: A.Value -> T.Parser TextEntities
   parseTextEntities = A.withObject "TextEntities" $ \o -> do
    entities <- optional $ o A..: "entities"
    return $ TextEntities { entities = entities }