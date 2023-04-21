{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.RecommendedChatFolder where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolder as ChatFolder
import qualified Utils as U

-- |
data RecommendedChatFolder = -- | Describes a recommended chat folder @folder The chat folder @param_description Chat folder description
  RecommendedChatFolder
  { -- |
    description :: Maybe String,
    -- |
    folder :: Maybe ChatFolder.ChatFolder
  }
  deriving (Eq)

instance Show RecommendedChatFolder where
  show
    RecommendedChatFolder
      { description = description_,
        folder = folder_
      } =
      "RecommendedChatFolder"
        ++ U.cc
          [ U.p "description" description_,
            U.p "folder" folder_
          ]

instance T.FromJSON RecommendedChatFolder where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "recommendedChatFolder" -> parseRecommendedChatFolder v
      _ -> mempty
    where
      parseRecommendedChatFolder :: A.Value -> T.Parser RecommendedChatFolder
      parseRecommendedChatFolder = A.withObject "RecommendedChatFolder" $ \o -> do
        description_ <- o A..:? "description"
        folder_ <- o A..:? "folder"
        return $ RecommendedChatFolder {description = description_, folder = folder_}
  parseJSON _ = mempty

instance T.ToJSON RecommendedChatFolder where
  toJSON
    RecommendedChatFolder
      { description = description_,
        folder = folder_
      } =
      A.object
        [ "@type" A..= T.String "recommendedChatFolder",
          "description" A..= description_,
          "folder" A..= folder_
        ]
