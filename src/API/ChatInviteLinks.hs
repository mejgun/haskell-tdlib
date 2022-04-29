-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinks where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatInviteLink as ChatInviteLink

-- |
-- 
-- Contains a list of chat invite links 
-- 
-- __total_count__ Approximate total number of chat invite links found
-- 
-- __invite_links__ List of invite links
data ChatInviteLinks = 

 ChatInviteLinks { invite_links :: Maybe [ChatInviteLink.ChatInviteLink], total_count :: Maybe Int }  deriving (Eq)

instance Show ChatInviteLinks where
 show ChatInviteLinks { invite_links=invite_links, total_count=total_count } =
  "ChatInviteLinks" ++ cc [p "invite_links" invite_links, p "total_count" total_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatInviteLinks where
 toJSON ChatInviteLinks { invite_links = invite_links, total_count = total_count } =
  A.object [ "@type" A..= T.String "chatInviteLinks", "invite_links" A..= invite_links, "total_count" A..= total_count ]

instance T.FromJSON ChatInviteLinks where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinks" -> parseChatInviteLinks v
   _ -> mempty
  where
   parseChatInviteLinks :: A.Value -> T.Parser ChatInviteLinks
   parseChatInviteLinks = A.withObject "ChatInviteLinks" $ \o -> do
    invite_links <- o A..:? "invite_links"
    total_count <- mconcat [ o A..:? "total_count", readMaybe <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatInviteLinks { invite_links = invite_links, total_count = total_count }
 parseJSON _ = mempty
