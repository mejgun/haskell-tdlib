-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateSupergroupChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns an existing chat corresponding to a known supergroup or channel 
-- 
-- __supergroup_id__ Supergroup or channel identifier
-- 
-- __force__ Pass true to create the chat without a network request. In this case all information about the chat except its type, title and photo can be incorrect
data CreateSupergroupChat = 

 CreateSupergroupChat { force :: Maybe Bool, supergroup_id :: Maybe Int }  deriving (Eq)

instance Show CreateSupergroupChat where
 show CreateSupergroupChat { force=force, supergroup_id=supergroup_id } =
  "CreateSupergroupChat" ++ U.cc [U.p "force" force, U.p "supergroup_id" supergroup_id ]

instance T.ToJSON CreateSupergroupChat where
 toJSON CreateSupergroupChat { force = force, supergroup_id = supergroup_id } =
  A.object [ "@type" A..= T.String "createSupergroupChat", "force" A..= force, "supergroup_id" A..= supergroup_id ]

instance T.FromJSON CreateSupergroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createSupergroupChat" -> parseCreateSupergroupChat v
   _ -> mempty
  where
   parseCreateSupergroupChat :: A.Value -> T.Parser CreateSupergroupChat
   parseCreateSupergroupChat = A.withObject "CreateSupergroupChat" $ \o -> do
    force <- o A..:? "force"
    supergroup_id <- mconcat [ o A..:? "supergroup_id", readMaybe <$> (o A..: "supergroup_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateSupergroupChat { force = force, supergroup_id = supergroup_id }
 parseJSON _ = mempty
