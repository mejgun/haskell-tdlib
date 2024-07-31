module TD.Query.GetMainWebApp
  (GetMainWebApp(..)
  , defaultGetMainWebApp
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ThemeParameters as ThemeParameters

-- | Returns information needed to open the main Web App of a bot. Returns 'TD.Data.MainWebApp.MainWebApp'
data GetMainWebApp
  = GetMainWebApp
    { chat_id          :: Maybe Int                             -- ^ Identifier of the chat in which the Web App is opened; pass 0 if none
    , bot_user_id      :: Maybe Int                             -- ^ Identifier of the target bot
    , start_parameter  :: Maybe T.Text                          -- ^ Start parameter from internalLinkTypeMainWebApp
    , theme            :: Maybe ThemeParameters.ThemeParameters -- ^ Preferred Web App theme; pass null to use the default theme
    , application_name :: Maybe T.Text                          -- ^ Short name of the current application; 0-64 English letters, digits, and underscores
    }
  deriving (Eq, Show)

instance I.ShortShow GetMainWebApp where
  shortShow
    GetMainWebApp
      { chat_id          = chat_id_
      , bot_user_id      = bot_user_id_
      , start_parameter  = start_parameter_
      , theme            = theme_
      , application_name = application_name_
      }
        = "GetMainWebApp"
          ++ I.cc
          [ "chat_id"          `I.p` chat_id_
          , "bot_user_id"      `I.p` bot_user_id_
          , "start_parameter"  `I.p` start_parameter_
          , "theme"            `I.p` theme_
          , "application_name" `I.p` application_name_
          ]

instance AT.ToJSON GetMainWebApp where
  toJSON
    GetMainWebApp
      { chat_id          = chat_id_
      , bot_user_id      = bot_user_id_
      , start_parameter  = start_parameter_
      , theme            = theme_
      , application_name = application_name_
      }
        = A.object
          [ "@type"            A..= AT.String "getMainWebApp"
          , "chat_id"          A..= chat_id_
          , "bot_user_id"      A..= bot_user_id_
          , "start_parameter"  A..= start_parameter_
          , "theme"            A..= theme_
          , "application_name" A..= application_name_
          ]

defaultGetMainWebApp :: GetMainWebApp
defaultGetMainWebApp =
  GetMainWebApp
    { chat_id          = Nothing
    , bot_user_id      = Nothing
    , start_parameter  = Nothing
    , theme            = Nothing
    , application_name = Nothing
    }

