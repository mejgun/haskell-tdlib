-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearRecentStickers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ClearRecentStickers = 
 ClearRecentStickers { is_attached :: Bool }  -- deriving (Show)

instance T.ToJSON ClearRecentStickers where
 toJSON (ClearRecentStickers { is_attached = is_attached }) =
  A.object [ "@type" A..= T.String "clearRecentStickers", "is_attached" A..= is_attached ]
-- clearRecentStickers ClearRecentStickers  { is_attached :: Bool } 



instance T.FromJSON ClearRecentStickers where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearRecentStickers" -> parseClearRecentStickers v
  where
   parseClearRecentStickers :: A.Value -> T.Parser ClearRecentStickers
   parseClearRecentStickers = A.withObject "ClearRecentStickers" $ \o -> do
    is_attached <- o A..: "is_attached"
    return $ ClearRecentStickers { is_attached = is_attached }