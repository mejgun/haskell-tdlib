-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SearchStickers = 
 SearchStickers { limit :: Int, emoji :: String }  deriving (Show)

instance T.ToJSON SearchStickers where
 toJSON (SearchStickers { limit = limit, emoji = emoji }) =
  A.object [ "@type" A..= T.String "searchStickers", "limit" A..= limit, "emoji" A..= emoji ]



instance T.FromJSON SearchStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchStickers" -> parseSearchStickers v

   _ -> mempty ""
  where
   parseSearchStickers :: A.Value -> T.Parser SearchStickers
   parseSearchStickers = A.withObject "SearchStickers" $ \o -> do
    limit <- o A..: "limit"
    emoji <- o A..: "emoji"
    return $ SearchStickers { limit = limit, emoji = emoji }