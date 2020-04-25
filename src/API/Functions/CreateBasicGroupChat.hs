-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.CreateBasicGroupChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data CreateBasicGroupChat = 
 CreateBasicGroupChat { force :: Maybe Bool, basic_group_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON CreateBasicGroupChat where
 toJSON (CreateBasicGroupChat { force = force, basic_group_id = basic_group_id }) =
  A.object [ "@type" A..= T.String "createBasicGroupChat", "force" A..= force, "basic_group_id" A..= basic_group_id ]

instance T.FromJSON CreateBasicGroupChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "createBasicGroupChat" -> parseCreateBasicGroupChat v
   _ -> mempty
  where
   parseCreateBasicGroupChat :: A.Value -> T.Parser CreateBasicGroupChat
   parseCreateBasicGroupChat = A.withObject "CreateBasicGroupChat" $ \o -> do
    force <- o A..:? "force"
    basic_group_id <- mconcat [ o A..:? "basic_group_id", readMaybe <$> (o A..: "basic_group_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ CreateBasicGroupChat { force = force, basic_group_id = basic_group_id }