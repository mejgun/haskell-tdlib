-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatJoinRequestsInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains information about pending join requests for a chat 
-- 
-- __total_count__ Total number of pending join requests
-- 
-- __user_ids__ Identifiers of at most 3 users sent the newest pending join requests
data ChatJoinRequestsInfo = 

 ChatJoinRequestsInfo { user_ids :: Maybe [Int], total_count :: Maybe Int }  deriving (Eq)

instance Show ChatJoinRequestsInfo where
 show ChatJoinRequestsInfo { user_ids=user_ids, total_count=total_count } =
  "ChatJoinRequestsInfo" ++ cc [p "user_ids" user_ids, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatJoinRequestsInfo where
 toJSON ChatJoinRequestsInfo { user_ids = user_ids, total_count = total_count } =
  A.object [ "@type" A..= T.String "chatJoinRequestsInfo", "user_ids" A..= user_ids, "total_count" A..= total_count ]

instance T.FromJSON ChatJoinRequestsInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatJoinRequestsInfo" -> parseChatJoinRequestsInfo v
   _ -> mempty
  where
   parseChatJoinRequestsInfo :: A.Value -> T.Parser ChatJoinRequestsInfo
   parseChatJoinRequestsInfo = A.withObject "ChatJoinRequestsInfo" $ \o -> do
    user_ids <- o A..:? "user_ids"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatJoinRequestsInfo { user_ids = user_ids, total_count = total_count }
 parseJSON _ = mempty
