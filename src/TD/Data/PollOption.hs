{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PollOption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data PollOption = -- | Describes one answer option of a poll @text Option text; 1-100 characters @voter_count Number of voters for this option, available only for closed or voted polls @vote_percentage The percentage of votes for this option; 0-100
  PollOption
  { -- |
    is_being_chosen :: Maybe Bool,
    -- | True, if the option was chosen by the user @is_being_chosen True, if the option is being chosen by a pending setPollAnswer request
    is_chosen :: Maybe Bool,
    -- |
    vote_percentage :: Maybe Int,
    -- |
    voter_count :: Maybe Int,
    -- |
    text :: Maybe String
  }
  deriving (Eq)

instance Show PollOption where
  show
    PollOption
      { is_being_chosen = is_being_chosen_,
        is_chosen = is_chosen_,
        vote_percentage = vote_percentage_,
        voter_count = voter_count_,
        text = text_
      } =
      "PollOption"
        ++ U.cc
          [ U.p "is_being_chosen" is_being_chosen_,
            U.p "is_chosen" is_chosen_,
            U.p "vote_percentage" vote_percentage_,
            U.p "voter_count" voter_count_,
            U.p "text" text_
          ]

instance T.FromJSON PollOption where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "pollOption" -> parsePollOption v
      _ -> mempty
    where
      parsePollOption :: A.Value -> T.Parser PollOption
      parsePollOption = A.withObject "PollOption" $ \o -> do
        is_being_chosen_ <- o A..:? "is_being_chosen"
        is_chosen_ <- o A..:? "is_chosen"
        vote_percentage_ <- o A..:? "vote_percentage"
        voter_count_ <- o A..:? "voter_count"
        text_ <- o A..:? "text"
        return $ PollOption {is_being_chosen = is_being_chosen_, is_chosen = is_chosen_, vote_percentage = vote_percentage_, voter_count = voter_count_, text = text_}
  parseJSON _ = mempty

instance T.ToJSON PollOption where
  toJSON
    PollOption
      { is_being_chosen = is_being_chosen_,
        is_chosen = is_chosen_,
        vote_percentage = vote_percentage_,
        voter_count = voter_count_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "pollOption",
          "is_being_chosen" A..= is_being_chosen_,
          "is_chosen" A..= is_chosen_,
          "vote_percentage" A..= vote_percentage_,
          "voter_count" A..= voter_count_,
          "text" A..= text_
        ]
