{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.AddedReactions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AddedReaction as AddedReaction
import qualified Utils as U

data AddedReactions = -- | Represents a list of reactions added to a message @total_count The total number of found reactions @reactions The list of added reactions @next_offset The offset for the next request. If empty, there are no more results
  AddedReactions
  { -- |
    next_offset :: Maybe String,
    -- |
    reactions :: Maybe [AddedReaction.AddedReaction],
    -- |
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show AddedReactions where
  show
    AddedReactions
      { next_offset = next_offset_,
        reactions = reactions_,
        total_count = total_count_
      } =
      "AddedReactions"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "reactions" reactions_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON AddedReactions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "addedReactions" -> parseAddedReactions v
      _ -> mempty
    where
      parseAddedReactions :: A.Value -> T.Parser AddedReactions
      parseAddedReactions = A.withObject "AddedReactions" $ \o -> do
        next_offset_ <- o A..:? "next_offset"
        reactions_ <- o A..:? "reactions"
        total_count_ <- mconcat [o A..:? "total_count", U.rm <$> (o A..: "total_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ AddedReactions {next_offset = next_offset_, reactions = reactions_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON AddedReactions where
  toJSON
    AddedReactions
      { next_offset = next_offset_,
        reactions = reactions_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "addedReactions",
          "next_offset" A..= next_offset_,
          "reactions" A..= reactions_,
          "total_count" A..= total_count_
        ]
