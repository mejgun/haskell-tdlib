-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPhoto where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

data ChatPhoto = 
 ChatPhoto { big :: Maybe File.File, small :: Maybe File.File }  deriving (Show)

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
    big <- optional $ o A..: "big"
    small <- optional $ o A..: "small"
    return $ ChatPhoto { big = big, small = small }