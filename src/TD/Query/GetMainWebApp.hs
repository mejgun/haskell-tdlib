module TD.Query.GetMainWebApp
  (GetMainWebApp(..)
  , defaultGetMainWebApp
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.WebAppOpenParameters as WebAppOpenParameters

-- | Returns information needed to open the main Web App of a bot. Returns 'TD.Data.MainWebApp.MainWebApp'
data GetMainWebApp
  = GetMainWebApp
    { chat_id         :: Maybe Int                                       -- ^ Identifier of the chat in which the Web App is opened; pass 0 if none
    , bot_user_id     :: Maybe Int                                       -- ^ Identifier of the target bot
    , start_parameter :: Maybe T.Text                                    -- ^ Start parameter from internalLinkTypeMainWebApp
    , parameters      :: Maybe WebAppOpenParameters.WebAppOpenParameters -- ^ Parameters to use to open the Web App
    }
  deriving (Eq, Show)

instance I.ShortShow GetMainWebApp where
  shortShow
    GetMainWebApp
      { chat_id         = chat_id_
      , bot_user_id     = bot_user_id_
      , start_parameter = start_parameter_
      , parameters      = parameters_
      }
        = "GetMainWebApp"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "bot_user_id"     `I.p` bot_user_id_
          , "start_parameter" `I.p` start_parameter_
          , "parameters"      `I.p` parameters_
          ]

instance AT.ToJSON GetMainWebApp where
  toJSON
    GetMainWebApp
      { chat_id         = chat_id_
      , bot_user_id     = bot_user_id_
      , start_parameter = start_parameter_
      , parameters      = parameters_
      }
        = A.object
          [ "@type"           A..= AT.String "getMainWebApp"
          , "chat_id"         A..= chat_id_
          , "bot_user_id"     A..= bot_user_id_
          , "start_parameter" A..= start_parameter_
          , "parameters"      A..= parameters_
          ]

defaultGetMainWebApp :: GetMainWebApp
defaultGetMainWebApp =
  GetMainWebApp
    { chat_id         = Nothing
    , bot_user_id     = Nothing
    , start_parameter = Nothing
    , parameters      = Nothing
    }

