-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatJoinRequests where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatJoinRequest as ChatJoinRequest

-- |
-- 
-- Contains a list of requests to join a chat 
-- 
-- __total_count__ Approximate total number of requests found
-- 
-- __requests__ List of the requests
data ChatJoinRequests = 

 ChatJoinRequests { requests :: Maybe [ChatJoinRequest.ChatJoinRequest], total_count :: Maybe Int }  deriving (Eq)

instance Show ChatJoinRequests where
 show ChatJoinRequests { requests=requests, total_count=total_count } =
  "ChatJoinRequests" ++ U.cc [U.p "requests" requests, U.p "total_count" total_count ]

instance T.ToJSON ChatJoinRequests where
 toJSON ChatJoinRequests { requests = requests, total_count = total_count } =
  A.object [ "@type" A..= T.String "chatJoinRequests", "requests" A..= requests, "total_count" A..= total_count ]

instance T.FromJSON ChatJoinRequests where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatJoinRequests" -> parseChatJoinRequests v
   _ -> mempty
  where
   parseChatJoinRequests :: A.Value -> T.Parser ChatJoinRequests
   parseChatJoinRequests = A.withObject "ChatJoinRequests" $ \o -> do
    requests <- o A..:? "requests"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatJoinRequests { requests = requests, total_count = total_count }
 parseJSON _ = mempty
