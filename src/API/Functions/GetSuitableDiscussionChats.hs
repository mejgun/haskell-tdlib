-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSuitableDiscussionChats where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Basic group chats need to be first upgraded to supergroups before they can be set as a discussion group
data GetSuitableDiscussionChats = 

 GetSuitableDiscussionChats deriving (Show, Eq)

instance T.ToJSON GetSuitableDiscussionChats where
 toJSON (GetSuitableDiscussionChats {  }) =
  A.object [ "@type" A..= T.String "getSuitableDiscussionChats" ]

instance T.FromJSON GetSuitableDiscussionChats where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getSuitableDiscussionChats" -> parseGetSuitableDiscussionChats v
   _ -> mempty
  where
   parseGetSuitableDiscussionChats :: A.Value -> T.Parser GetSuitableDiscussionChats
   parseGetSuitableDiscussionChats = A.withObject "GetSuitableDiscussionChats" $ \o -> do
    return $ GetSuitableDiscussionChats {  }