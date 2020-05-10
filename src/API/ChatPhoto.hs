-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Describes the photo of a chat 
-- 
-- __small__ A small (160x160) chat photo. The file can be downloaded only before the photo is changed
-- 
-- __big__ A big (640x640) chat photo. The file can be downloaded only before the photo is changed
data ChatPhoto = 

 ChatPhoto { big :: Maybe File.File, small :: Maybe File.File }  deriving (Show, Eq)

instance T.ToJSON ChatPhoto where
 toJSON (ChatPhoto { big = big, small = small }) =
  A.object [ "@type" A..= T.String "chatPhoto", "big" A..= big, "small" A..= small ]

instance T.FromJSON ChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatPhoto" -> parseChatPhoto v
   _ -> mempty
  where
   parseChatPhoto :: A.Value -> T.Parser ChatPhoto
   parseChatPhoto = A.withObject "ChatPhoto" $ \o -> do
    big <- o A..:? "big"
    small <- o A..:? "small"
    return $ ChatPhoto { big = big, small = small }