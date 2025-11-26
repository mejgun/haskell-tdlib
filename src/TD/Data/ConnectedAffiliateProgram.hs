module TD.Data.ConnectedAffiliateProgram
  (ConnectedAffiliateProgram(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.AffiliateProgramParameters as AffiliateProgramParameters

data ConnectedAffiliateProgram
  = ConnectedAffiliateProgram -- ^ Describes an affiliate program that was connected to an affiliate
    { url                :: Maybe T.Text                                                -- ^ The link that can be used to refer users if the program is still active
    , bot_user_id        :: Maybe Int                                                   -- ^ User identifier of the bot created the program
    , parameters         :: Maybe AffiliateProgramParameters.AffiliateProgramParameters -- ^ The parameters of the affiliate program
    , connection_date    :: Maybe Int                                                   -- ^ Point in time (Unix timestamp) when the affiliate program was connected
    , is_disconnected    :: Maybe Bool                                                  -- ^ True, if the program was canceled by the bot, or disconnected by the chat owner and isn't available anymore
    , user_count         :: Maybe Int                                                   -- ^ The number of users that used the affiliate program
    , revenue_star_count :: Maybe Int                                                   -- ^ The number of Telegram Stars that were earned by the affiliate program
    }
  deriving (Eq, Show)

instance I.ShortShow ConnectedAffiliateProgram where
  shortShow ConnectedAffiliateProgram
    { url                = url_
    , bot_user_id        = bot_user_id_
    , parameters         = parameters_
    , connection_date    = connection_date_
    , is_disconnected    = is_disconnected_
    , user_count         = user_count_
    , revenue_star_count = revenue_star_count_
    }
      = "ConnectedAffiliateProgram"
        ++ I.cc
        [ "url"                `I.p` url_
        , "bot_user_id"        `I.p` bot_user_id_
        , "parameters"         `I.p` parameters_
        , "connection_date"    `I.p` connection_date_
        , "is_disconnected"    `I.p` is_disconnected_
        , "user_count"         `I.p` user_count_
        , "revenue_star_count" `I.p` revenue_star_count_
        ]

instance AT.FromJSON ConnectedAffiliateProgram where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "connectedAffiliateProgram" -> parseConnectedAffiliateProgram v
      _                           -> mempty
    
    where
      parseConnectedAffiliateProgram :: A.Value -> AT.Parser ConnectedAffiliateProgram
      parseConnectedAffiliateProgram = A.withObject "ConnectedAffiliateProgram" $ \o -> do
        url_                <- o A..:?                       "url"
        bot_user_id_        <- o A..:?                       "bot_user_id"
        parameters_         <- o A..:?                       "parameters"
        connection_date_    <- o A..:?                       "connection_date"
        is_disconnected_    <- o A..:?                       "is_disconnected"
        user_count_         <- fmap I.readInt64 <$> o A..:?  "user_count"
        revenue_star_count_ <- o A..:?                       "revenue_star_count"
        pure $ ConnectedAffiliateProgram
          { url                = url_
          , bot_user_id        = bot_user_id_
          , parameters         = parameters_
          , connection_date    = connection_date_
          , is_disconnected    = is_disconnected_
          , user_count         = user_count_
          , revenue_star_count = revenue_star_count_
          }
  parseJSON _ = mempty

