{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.RecommendedChatFilter where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatFilter as ChatFilter
import qualified Utils as U

data RecommendedChatFilter = -- | Describes a recommended chat filter @filter The chat filter @param_description Chat filter description
  RecommendedChatFilter
  { -- |
    description :: Maybe String,
    -- |
    _filter :: Maybe ChatFilter.ChatFilter
  }
  deriving (Eq)

instance Show RecommendedChatFilter where
  show
    RecommendedChatFilter
      { description = description,
        _filter = _filter
      } =
      "RecommendedChatFilter"
        ++ U.cc
          [ U.p "description" description,
            U.p "_filter" _filter
          ]

instance T.FromJSON RecommendedChatFilter where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "recommendedChatFilter" -> parseRecommendedChatFilter v
      _ -> fail ""
    where
      parseRecommendedChatFilter :: A.Value -> T.Parser RecommendedChatFilter
      parseRecommendedChatFilter = A.withObject "RecommendedChatFilter" $ \o -> do
        description_ <- o A..:? "description"
        _filter_ <- o A..:? "filter"
        return $ RecommendedChatFilter {description = description_, _filter = _filter_}
  parseJSON _ = fail ""

instance T.ToJSON RecommendedChatFilter where
  toJSON
    RecommendedChatFilter
      { description = description,
        _filter = _filter
      } =
      A.object
        [ "@type" A..= T.String "recommendedChatFilter",
          "description" A..= description,
          "filter" A..= _filter
        ]
