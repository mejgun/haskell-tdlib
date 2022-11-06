{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PublicChatType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a type of public chats
data PublicChatType
  = -- | The chat is public, because it has an active username
    PublicChatTypeHasUsername
  | -- | The chat is public, because it is a location-based supergroup
    PublicChatTypeIsLocationBased
  deriving (Eq)

instance Show PublicChatType where
  show PublicChatTypeHasUsername =
    "PublicChatTypeHasUsername"
      ++ U.cc
        []
  show PublicChatTypeIsLocationBased =
    "PublicChatTypeIsLocationBased"
      ++ U.cc
        []

instance T.FromJSON PublicChatType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "publicChatTypeHasUsername" -> parsePublicChatTypeHasUsername v
      "publicChatTypeIsLocationBased" -> parsePublicChatTypeIsLocationBased v
      _ -> mempty
    where
      parsePublicChatTypeHasUsername :: A.Value -> T.Parser PublicChatType
      parsePublicChatTypeHasUsername = A.withObject "PublicChatTypeHasUsername" $ \_ -> return PublicChatTypeHasUsername

      parsePublicChatTypeIsLocationBased :: A.Value -> T.Parser PublicChatType
      parsePublicChatTypeIsLocationBased = A.withObject "PublicChatTypeIsLocationBased" $ \_ -> return PublicChatTypeIsLocationBased
  parseJSON _ = mempty

instance T.ToJSON PublicChatType where
  toJSON PublicChatTypeHasUsername =
    A.object
      [ "@type" A..= T.String "publicChatTypeHasUsername"
      ]
  toJSON PublicChatTypeIsLocationBased =
    A.object
      [ "@type" A..= T.String "publicChatTypeIsLocationBased"
      ]
