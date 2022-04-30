-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetVideoChatAvailableParticipants where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns list of participant identifiers, on whose behalf a video chat in the chat can be joined 
-- 
-- __chat_id__ Chat identifier
data GetVideoChatAvailableParticipants = 

 GetVideoChatAvailableParticipants { chat_id :: Maybe Int }  deriving (Eq)

instance Show GetVideoChatAvailableParticipants where
 show GetVideoChatAvailableParticipants { chat_id=chat_id } =
  "GetVideoChatAvailableParticipants" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON GetVideoChatAvailableParticipants where
 toJSON GetVideoChatAvailableParticipants { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getVideoChatAvailableParticipants", "chat_id" A..= chat_id ]

instance T.FromJSON GetVideoChatAvailableParticipants where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getVideoChatAvailableParticipants" -> parseGetVideoChatAvailableParticipants v
   _ -> mempty
  where
   parseGetVideoChatAvailableParticipants :: A.Value -> T.Parser GetVideoChatAvailableParticipants
   parseGetVideoChatAvailableParticipants = A.withObject "GetVideoChatAvailableParticipants" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetVideoChatAvailableParticipants { chat_id = chat_id }
 parseJSON _ = mempty
