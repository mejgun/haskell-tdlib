-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearRecentlyFoundChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Clears the list of recently found chats
data ClearRecentlyFoundChats = 

 ClearRecentlyFoundChats deriving (Show, Eq)

instance T.ToJSON ClearRecentlyFoundChats where
 toJSON (ClearRecentlyFoundChats {  }) =
  A.object [ "@type" A..= T.String "clearRecentlyFoundChats" ]

instance T.FromJSON ClearRecentlyFoundChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearRecentlyFoundChats" -> parseClearRecentlyFoundChats v
   _ -> mempty
  where
   parseClearRecentlyFoundChats :: A.Value -> T.Parser ClearRecentlyFoundChats
   parseClearRecentlyFoundChats = A.withObject "ClearRecentlyFoundChats" $ \o -> do
    return $ ClearRecentlyFoundChats {  }