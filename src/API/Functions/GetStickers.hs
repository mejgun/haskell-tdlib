-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetStickers = 
 GetStickers { limit :: Int, emoji :: String }  deriving (Show)

instance T.ToJSON GetStickers where
 toJSON (GetStickers { limit = limit, emoji = emoji }) =
  A.object [ "@type" A..= T.String "getStickers", "limit" A..= limit, "emoji" A..= emoji ]



instance T.FromJSON GetStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getStickers" -> parseGetStickers v

   _ -> mempty ""
  where
   parseGetStickers :: A.Value -> T.Parser GetStickers
   parseGetStickers = A.withObject "GetStickers" $ \o -> do
    limit <- o A..: "limit"
    emoji <- o A..: "emoji"
    return $ GetStickers { limit = limit, emoji = emoji }