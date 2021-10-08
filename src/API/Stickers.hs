-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Stickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Sticker as Sticker

-- |
-- 
-- Represents a list of stickers 
-- 
-- __stickers__ List of stickers
data Stickers = 

 Stickers { stickers :: Maybe [Sticker.Sticker] }  deriving (Eq)

instance Show Stickers where
 show Stickers { stickers=stickers } =
  "Stickers" ++ cc [p "stickers" stickers ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Stickers where
 toJSON Stickers { stickers = stickers } =
  A.object [ "@type" A..= T.String "stickers", "stickers" A..= stickers ]

instance T.FromJSON Stickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stickers" -> parseStickers v
   _ -> mempty
  where
   parseStickers :: A.Value -> T.Parser Stickers
   parseStickers = A.withObject "Stickers" $ \o -> do
    stickers <- o A..:? "stickers"
    return $ Stickers { stickers = stickers }
 parseJSON _ = mempty
