-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetFavoriteStickers where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns favorite stickers
data GetFavoriteStickers = 

 GetFavoriteStickers deriving (Eq)

instance Show GetFavoriteStickers where
 show GetFavoriteStickers {  } =
  "GetFavoriteStickers" ++ cc [ ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetFavoriteStickers where
 toJSON GetFavoriteStickers {  } =
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
 parseJSON _ = mempty
