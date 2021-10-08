-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatisticsInviterInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains statistics about number of new members invited by a user
-- 
-- __user_id__ User identifier
-- 
-- __added_member_count__ Number of new members invited by the user
data ChatStatisticsInviterInfo = 

 ChatStatisticsInviterInfo { added_member_count :: Maybe Int, user_id :: Maybe Int }  deriving (Eq)

instance Show ChatStatisticsInviterInfo where
 show ChatStatisticsInviterInfo { added_member_count=added_member_count, user_id=user_id } =
  "ChatStatisticsInviterInfo" ++ cc [p "added_member_count" added_member_count, p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatStatisticsInviterInfo where
 toJSON ChatStatisticsInviterInfo { added_member_count = added_member_count, user_id = user_id } =
  A.object [ "@type" A..= T.String "chatStatisticsInviterInfo", "added_member_count" A..= added_member_count, "user_id" A..= user_id ]

instance T.FromJSON ChatStatisticsInviterInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatisticsInviterInfo" -> parseChatStatisticsInviterInfo v
   _ -> mempty
  where
   parseChatStatisticsInviterInfo :: A.Value -> T.Parser ChatStatisticsInviterInfo
   parseChatStatisticsInviterInfo = A.withObject "ChatStatisticsInviterInfo" $ \o -> do
    added_member_count <- mconcat [ o A..:? "added_member_count", readMaybe <$> (o A..: "added_member_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatStatisticsInviterInfo { added_member_count = added_member_count, user_id = user_id }
 parseJSON _ = mempty
