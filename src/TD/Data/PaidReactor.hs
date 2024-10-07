module TD.Data.PaidReactor
  (PaidReactor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data PaidReactor
  = PaidReactor -- ^ Contains information about a user that added paid reactions
    { sender_id    :: Maybe MessageSender.MessageSender -- ^ Identifier of the user or chat that added the reactions; may be null for anonymous reactors that aren't the current user
    , star_count   :: Maybe Int                         -- ^ Number of Telegram Stars added
    , is_top       :: Maybe Bool                        -- ^ True, if the reactor is one of the most active reactors; may be false if the reactor is the current user
    , is_me        :: Maybe Bool                        -- ^ True, if the paid reaction was added by the current user
    , is_anonymous :: Maybe Bool                        -- ^ True, if the reactor is anonymous
    }
  deriving (Eq, Show)

instance I.ShortShow PaidReactor where
  shortShow PaidReactor
    { sender_id    = sender_id_
    , star_count   = star_count_
    , is_top       = is_top_
    , is_me        = is_me_
    , is_anonymous = is_anonymous_
    }
      = "PaidReactor"
        ++ I.cc
        [ "sender_id"    `I.p` sender_id_
        , "star_count"   `I.p` star_count_
        , "is_top"       `I.p` is_top_
        , "is_me"        `I.p` is_me_
        , "is_anonymous" `I.p` is_anonymous_
        ]

instance AT.FromJSON PaidReactor where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paidReactor" -> parsePaidReactor v
      _             -> mempty
    
    where
      parsePaidReactor :: A.Value -> AT.Parser PaidReactor
      parsePaidReactor = A.withObject "PaidReactor" $ \o -> do
        sender_id_    <- o A..:?  "sender_id"
        star_count_   <- o A..:?  "star_count"
        is_top_       <- o A..:?  "is_top"
        is_me_        <- o A..:?  "is_me"
        is_anonymous_ <- o A..:?  "is_anonymous"
        pure $ PaidReactor
          { sender_id    = sender_id_
          , star_count   = star_count_
          , is_top       = is_top_
          , is_me        = is_me_
          , is_anonymous = is_anonymous_
          }
  parseJSON _ = mempty

