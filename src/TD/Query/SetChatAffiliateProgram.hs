module TD.Query.SetChatAffiliateProgram
  (SetChatAffiliateProgram(..)
  , defaultSetChatAffiliateProgram
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AffiliateProgramParameters as AffiliateProgramParameters

-- | Changes affiliate program for a bot. Returns 'TD.Data.Ok.Ok'
data SetChatAffiliateProgram
  = SetChatAffiliateProgram
    { chat_id    :: Maybe Int                                                   -- ^ Identifier of the chat with an owned bot for which affiliate program is changed
    , parameters :: Maybe AffiliateProgramParameters.AffiliateProgramParameters -- ^ Parameters of the affiliate program; pass null to close the currently active program. If there is an active program, then commission and program duration can only be increased. If the active program is scheduled to be closed, then it can't be changed anymore
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatAffiliateProgram where
  shortShow
    SetChatAffiliateProgram
      { chat_id    = chat_id_
      , parameters = parameters_
      }
        = "SetChatAffiliateProgram"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "parameters" `I.p` parameters_
          ]

instance AT.ToJSON SetChatAffiliateProgram where
  toJSON
    SetChatAffiliateProgram
      { chat_id    = chat_id_
      , parameters = parameters_
      }
        = A.object
          [ "@type"      A..= AT.String "setChatAffiliateProgram"
          , "chat_id"    A..= chat_id_
          , "parameters" A..= parameters_
          ]

defaultSetChatAffiliateProgram :: SetChatAffiliateProgram
defaultSetChatAffiliateProgram =
  SetChatAffiliateProgram
    { chat_id    = Nothing
    , parameters = Nothing
    }

