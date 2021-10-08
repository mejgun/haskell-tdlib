-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.TextEntities where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.TextEntity as TextEntity

-- |
-- 
-- Contains a list of text entities 
-- 
-- __entities__ List of text entities
data TextEntities = 

 TextEntities { entities :: Maybe [TextEntity.TextEntity] }  deriving (Eq)

instance Show TextEntities where
 show TextEntities { entities=entities } =
  "TextEntities" ++ cc [p "entities" entities ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON TextEntities where
 toJSON TextEntities { entities = entities } =
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
    entities <- o A..:? "entities"
    return $ TextEntities { entities = entities }
 parseJSON _ = mempty
