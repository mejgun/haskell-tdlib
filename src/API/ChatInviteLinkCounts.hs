-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatInviteLinkCounts where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatInviteLinkCount as ChatInviteLinkCount

-- |
-- 
-- Contains a list of chat invite link counts 
-- 
-- __invite_link_counts__ List of invite linkcounts
data ChatInviteLinkCounts = 

 ChatInviteLinkCounts { invite_link_counts :: Maybe [ChatInviteLinkCount.ChatInviteLinkCount] }  deriving (Eq)

instance Show ChatInviteLinkCounts where
 show ChatInviteLinkCounts { invite_link_counts=invite_link_counts } =
  "ChatInviteLinkCounts" ++ cc [p "invite_link_counts" invite_link_counts ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ChatInviteLinkCounts where
 toJSON ChatInviteLinkCounts { invite_link_counts = invite_link_counts } =
  A.object [ "@type" A..= T.String "chatInviteLinkCounts", "invite_link_counts" A..= invite_link_counts ]

instance T.FromJSON ChatInviteLinkCounts where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatInviteLinkCounts" -> parseChatInviteLinkCounts v
   _ -> mempty
  where
   parseChatInviteLinkCounts :: A.Value -> T.Parser ChatInviteLinkCounts
   parseChatInviteLinkCounts = A.withObject "ChatInviteLinkCounts" $ \o -> do
    invite_link_counts <- o A..:? "invite_link_counts"
    return $ ChatInviteLinkCounts { invite_link_counts = invite_link_counts }
 parseJSON _ = mempty
