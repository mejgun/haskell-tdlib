{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Updates where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Update as Update
import qualified Utils as U

data Updates = -- | Contains a list of updates @updates List of updates
  Updates
  { -- |
    updates :: Maybe [Update.Update]
  }
  deriving (Eq)

instance Show Updates where
  show
    Updates
      { updates = updates
      } =
      "Updates"
        ++ U.cc
          [ U.p "updates" updates
          ]

instance T.FromJSON Updates where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "updates" -> parseUpdates v
      _ -> fail ""
    where
      parseUpdates :: A.Value -> T.Parser Updates
      parseUpdates = A.withObject "Updates" $ \o -> do
        updates_ <- o A..:? "updates"
        return $ Updates {updates = updates_}
  parseJSON _ = fail ""

instance T.ToJSON Updates where
  toJSON
    Updates
      { updates = updates
      } =
      A.object
        [ "@type" A..= T.String "updates",
          "updates" A..= updates
        ]
