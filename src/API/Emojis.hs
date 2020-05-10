-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Emojis where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Represents a list of emoji 
-- 
-- __emojis__ List of emojis
data Emojis = 

 Emojis { emojis :: Maybe [String] }  deriving (Show, Eq)

instance T.ToJSON Emojis where
 toJSON (Emojis { emojis = emojis }) =
  A.object [ "@type" A..= T.String "emojis", "emojis" A..= emojis ]

instance T.FromJSON Emojis where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "emojis" -> parseEmojis v
   _ -> mempty
  where
   parseEmojis :: A.Value -> T.Parser Emojis
   parseEmojis = A.withObject "Emojis" $ \o -> do
    emojis <- o A..:? "emojis"
    return $ Emojis { emojis = emojis }