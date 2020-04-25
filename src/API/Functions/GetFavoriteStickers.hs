-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFavoriteStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetFavoriteStickers = 
 GetFavoriteStickers deriving (Show, Eq)

instance T.ToJSON GetFavoriteStickers where
 toJSON (GetFavoriteStickers {  }) =
  A.object [ "@type" A..= T.String "getFavoriteStickers" ]

instance T.FromJSON GetFavoriteStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getFavoriteStickers" -> parseGetFavoriteStickers v
   _ -> mempty
  where
   parseGetFavoriteStickers :: A.Value -> T.Parser GetFavoriteStickers
   parseGetFavoriteStickers = A.withObject "GetFavoriteStickers" $ \o -> do
    return $ GetFavoriteStickers {  }