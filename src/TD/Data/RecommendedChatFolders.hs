module TD.Data.RecommendedChatFolders
  (RecommendedChatFolders(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.RecommendedChatFolder as RecommendedChatFolder

data RecommendedChatFolders
  = RecommendedChatFolders -- ^ Contains a list of recommended chat folders
    { chat_folders :: Maybe [RecommendedChatFolder.RecommendedChatFolder] -- ^ List of recommended chat folders
    }
  deriving (Eq, Show)

instance I.ShortShow RecommendedChatFolders where
  shortShow RecommendedChatFolders
    { chat_folders = chat_folders_
    }
      = "RecommendedChatFolders"
        ++ I.cc
        [ "chat_folders" `I.p` chat_folders_
        ]

instance AT.FromJSON RecommendedChatFolders where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "recommendedChatFolders" -> parseRecommendedChatFolders v
      _                        -> mempty
    
    where
      parseRecommendedChatFolders :: A.Value -> AT.Parser RecommendedChatFolders
      parseRecommendedChatFolders = A.withObject "RecommendedChatFolders" $ \o -> do
        chat_folders_ <- o A..:?  "chat_folders"
        pure $ RecommendedChatFolders
          { chat_folders = chat_folders_
          }
  parseJSON _ = mempty

