{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RecommendedChatFolders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.RecommendedChatFolder as RecommendedChatFolder
import qualified Utils as U

-- |
data RecommendedChatFolders = -- | Contains a list of recommended chat folders @chat_folders List of recommended chat folders
  RecommendedChatFolders
  { -- |
    chat_folders :: Maybe [RecommendedChatFolder.RecommendedChatFolder]
  }
  deriving (Eq)

instance Show RecommendedChatFolders where
  show
    RecommendedChatFolders
      { chat_folders = chat_folders_
      } =
      "RecommendedChatFolders"
        ++ U.cc
          [ U.p "chat_folders" chat_folders_
          ]

instance T.FromJSON RecommendedChatFolders where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "recommendedChatFolders" -> parseRecommendedChatFolders v
      _ -> mempty
    where
      parseRecommendedChatFolders :: A.Value -> T.Parser RecommendedChatFolders
      parseRecommendedChatFolders = A.withObject "RecommendedChatFolders" $ \o -> do
        chat_folders_ <- o A..:? "chat_folders"
        return $ RecommendedChatFolders {chat_folders = chat_folders_}
  parseJSON _ = mempty

instance T.ToJSON RecommendedChatFolders where
  toJSON
    RecommendedChatFolders
      { chat_folders = chat_folders_
      } =
      A.object
        [ "@type" A..= T.String "recommendedChatFolders",
          "chat_folders" A..= chat_folders_
        ]
